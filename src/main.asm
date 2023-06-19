; This file imports all of the data to the final ROM,
; and does some binhacks that you can toggle using the flags.

.gba
.open "build/rh-atlus.gba","build/rh-eng.gba", 0x08000000

_skiprhythmtest equ 0				; Skips the Rhythm Test when you don't have a save file.
_debug equ 0						; Various Debug hacks, unlock everything, etc...
_oamluaconsolemessages equ 1		; Logs OAM loads in RAM (for the gfxLocator.lua script)
_spriteluaconsolemessages equ 1		; Logs Sprite loads in RAM (for the gfxLocator.lua script)
_autoplay equ 0						; Experimental Autoplay for various reasons (getting perfects, etc...) (DOESN'T ALWAYS WORK!)
; If you're looking for the Debug Menu it's actually now in-game, you need to press L & R when loading into Game Select from the Main Menu.

.if _skiprhythmtest ==1
	.warning "Rhythm Test will be skipped, do NOT use for release!"
.endif

.if _debug ==1
	.warning "Debug flag enabled! This will result in every part of the game already unlocked, do NOT use for release!"
.endif

.if _oamluaconsolemessages ==1
	.warning "OAM Log Enabled, while not deadly, should be disabled because it might cause lag, or/and more..."
.endif

.if _spriteluaconsolemessages ==1
	.warning "Sprite Log Enabled, while not deadly, should be disabled because it might cause lag, or/and more..."
.endif

.if _autoplay ==1
	.warning "Auto-Play Enabled, do NOT use for release!"
.endif

; -- Version Checking --
gameVersion equ readbyte("build/rh-atlus.gba", 0xBD)

.if gameVersion == 0x24
	.error "Your ROM of Rhythm Tengoku is uncompatible! (Rev 1 detected, you need a Rev 0 ROM)"
.elseif gameVersion == 0x26
	.error "Your ROM of Rhythm Tengoku is uncompatible! (Kiosk Demo detected, you need a Rev 0 ROM)"
.endif

.include "src/relocate.asm"

.include "gfx/Font/font.asm"
.include "gfx/RhythmGames/RatRace/ratrace.asm"
.include "gfx/RhythmGames/NightWalk/nightwalk.asm"
.include "gfx/RhythmGames/KarateMan/karateman.asm"
.include "gfx/RhythmGames/TheClappyTrio/clappy.asm"
.include "gfx/RhythmGames/TheSnappyTrio/snappy.asm"
.include "gfx/RhythmGames/Polyrhythm/polyrhythm.asm"
.include "gfx/RhythmGames/BouncyRoad/bouncy.asm"
.include "gfx/RhythmGames/ResultScreen/result.asm"
.include "gfx/RhythmGames/PowerCalligraphy/power.asm"
.include "gfx/RhythmGames/TapTrial/tap.asm"
.include "gfx/RhythmGames/MarchingOrders/marching.asm"
.include "gfx/RhythmGames/MarchingOrders2/marching2.asm"
.include "gfx/RhythmGames/SneakySpirits/sneaky.asm"
.include "gfx/RhythmGames/QuizShow/quizshow.asm"
.include "gfx/RhythmGames/RhythmTweezers/tweezers.asm"
.include "gfx/RhythmGames/NinjaBodyguard/bodyguard.asm"
.include "gfx/RhythmGames/NinjaReincarnate/descendant.asm"
.include "gfx/RhythmGames/TheBonOdori/bonodori.asm"
.include "gfx/RhythmGames/TossTeam/tossteam.asm"
.include "gfx/RhythmGames/TramPauline/tramp.asm"
.include "gfx/RhythmGames/SickBeats/sickbeats.asm"
.include "gfx/RhythmGames/Showtime/showtime.asm"
.include "gfx/RhythmGames/RAPMEN/rapmen.asm"
.include "gfx/RhythmGames/Remix1/remix1.asm"
.include "gfx/RhythmGames/Remix2/remix2.asm"
.include "gfx/RhythmGames/Remix3/remix3.asm"
.include "gfx/RhythmGames/Remix4/remix4.asm"
.include "gfx/RhythmGames/Remix5/remix5.asm"
.include "gfx/RhythmGames/Remix6/remix6.asm"
.include "gfx/RhythmGames/Remix7/remix7.asm"
.include "gfx/RhythmGames/Remix8/remix8.asm"
.include "gfx/RhythmGames/SpaceDance/spacedance.asm"
.include "gfx/RhythmGames/Spaceball/spaceball.asm"
.include "gfx/HealthSafety/healthsafety.asm"
.include "gfx/Studio/studio.asm"
.include "gfx/MainMenu/mainmenu.asm"
.include "gfx/MedalCorner/medalcorner.asm"
.include "gfx/RhythmToys/rhythmtoys.asm"
.include "gfx/EndlessGames/endlessgames.asm"
.include "gfx/EndlessGames/MrUpbeat/upbeat.asm"
.include "gfx/EndlessGames/MannequinFactory/slapface.asm"
.include "gfx/DrumLessons/drumlessons.asm"
.include "gfx/RhythmArchives/archives.asm"
.include "gfx/GameSelect/gameselect.asm"
.include "gfx/RhythmTest/rtest.asm"
.include "gfx/Options/options.asm"
.include "gfx/Common/common.asm"
.include "gfx/Perfect/perfect.asm"

.include "sfx/DrumLessons/drumlessons.asm"
; .include "sfx/MarchingOrders/marching.asm"
; .include "sfx/Remix5/remix5.asm"
; .include "sfx/TempoUp/RhythmTweezers/tweezers.asm"
; .include "sfx/SpaceDance/space.asm"

.include "src/DebugMenu/debugmenu.asm"
.include "src/TempoUp/KarateMan/karateman.asm"

.include "src/asm_relocate.asm"
.include "src/asm.asm"

.close