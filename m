From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Jul 2009 06:36:54 +0000 (UTC)
Subject: [Buildroot] [Bug 477] New: Add sdl_sound package
Message-ID: <bug-477-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=477

           Summary: Add sdl_sound package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: evan.zelkowitz at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


SDL_sound is a library that handles the decoding of several popular sound file
formats, such as .WAV and .MP3. It is meant to make the programmer's sound
playback tasks simpler. The programmer gives SDL_sound a filename, or feeds it
data directly from one of many sources, and then reads the decoded waveform
data back at her leisure. If resource constraints are a concern, SDL_sound can
process sound data in programmer-specified blocks. Alternately, SDL_sound can
decode a whole sound file and hand back a single pointer to the whole waveform.
SDL_sound can also handle sample rate, audio format, and channel conversion
on-the-fly and behind-the-scenes, if the programmer desires. 

http://icculus.org/SDL_sound/

I have added this to my local buildroot so I figured I would see if this was
desired on git


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
