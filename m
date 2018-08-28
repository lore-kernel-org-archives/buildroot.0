From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 16:35:55 +0200
Subject: [Buildroot] SDL2+directfb combo does not work as built by
 buildroot-2018.02.3
In-Reply-To: <CAGrGpJCe67xHWAceYw6-oD=iPoL0be8-ZhRgmWfhQRuG0GwxeA@mail.gmail.com>
 (Peter Thompson's message of "Tue, 28 Aug 2018 08:17:33 -0600")
References: <CAGrGpJDVHStp8MUZaGb1=ZfWud-k4fQP=piwsc-QfftCDFyKog@mail.gmail.com>
 <CAGrGpJA=Kk0fGjMPfH3R1ZbyJbonPNPQoyC_tpjaF9Ua92BNNg@mail.gmail.com>
 <878t4q7vqu.fsf@dell.be.48ers.dk>
 <CAGrGpJCe67xHWAceYw6-oD=iPoL0be8-ZhRgmWfhQRuG0GwxeA@mail.gmail.com>
Message-ID: <87a7p65zjo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Thompson <peter.macleod.thompson@gmail.com> writes:

 > Hi Peter
 > My original plan was to wait for the next SDL2 release thereby allowing
 > SDL2 to fix itself before updating the SDL2_VERSION in  buildroot.

 > Otherwise we have to change buildroot SDL2_VERSION to  point to the
 > temporary patched SDL2 source for download:
 > http://www.libsdl.org/tmp/SDL-2.0.zip
 > OR
 > somehow change buildroot to download this patch and apply it to the
 > downloaded SDL2-2.0.8 before compiling (I am not sure how to do this in
 > buildroot).

.. Or simply include the hg commit as a .patch file in the package.

 > Then we would need to re-change this all back when the new release of SDL2
 > incorporates this patch.

Correct.

Do you know when sdl2-2.0.9 is planned? 2.0.8 is what we are using both
for 2018.02 (the current long term support version), 2018.05 (the
current release) and master (what will very soon become 2018.08).

-- 
Bye, Peter Korsgaard
