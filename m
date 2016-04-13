From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Apr 2016 23:02:05 +0200
Subject: [Buildroot] [PATCH 3/4] board/minnowboard-max: Add more
	peripherals and features to the kernel
In-Reply-To: <CAAEAJfDu8vgHZ21s+5EvF99t0tJwf8ix603B1iF=0mcwS9pxMg@mail.gmail.com>
 (Ezequiel Garcia's message of "Tue, 12 Apr 2016 20:55:51 -0300")
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570D84BC.40808@mind.be>
 <CAAEAJfDu8vgHZ21s+5EvF99t0tJwf8ix603B1iF=0mcwS9pxMg@mail.gmail.com>
Message-ID: <8737qpjk8i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > On 12 April 2016 at 20:29, Arnout Vandecappelle <arnout@mind.be> wrote:
 >> On 04/12/16 07:29, Ezequiel Garcia wrote:
 >>> 
 >>> This commit enables support for:
 >>> * HDMI audio
 >>> * Support for user-provided EDID firmware
 >>> (useful to workaround broken monitors)
 >>> * Evdev interface
 >>> * System V IPC (required by ALSA)
 >>> * POSIX message queue
 >>> * fhandle syscall
 >>> * cgroups
 >> 
 >> 
 >> Why cgroups?
 >> 

 > Well, in fact... the commit log is not correct. My initial intention
 > was to add IPC (required by ALSA), HDMI audio and evdev.

 > As you can imagine, the goal was to play supertuxkart.

 > The rest of the configs got added by Buildroot, because
 > of the systemd presence:

Ok, will you send a new version with only the needed changes?

Thanks.

-- 
Bye, Peter Korsgaard
