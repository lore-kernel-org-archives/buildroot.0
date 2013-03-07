From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 7 Mar 2013 09:44:35 +0000
Subject: [Buildroot] [PATCH] Revert "uClibc: port linuxthreads
 errnopatch to 0.9.33.2"
In-Reply-To: <CFB67F3F72BB450DAF0C0E10C27DFC00@JohanW7>
References: <1361455787-4846-1-git-send-email-gustavo@zacarias.com.ar>
 <877gm1hhsm.fsf@dell.be.48ers.dk>
 <CFB67F3F72BB450DAF0C0E10C27DFC00@JohanW7>
Message-ID: <CAHt8ZCMGkcF=uG7bT=E=yhfyGTMrZL=T1oN955AD=0eidSCdEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 February 2013 12:39, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> I saw this patch was reverted, so I wonder is there (already or in the making) a way so I can point to a directory in the buildroot
> configuration where I have additional ?Clibc patches and a 'series' file ? (similar like the infrastructure for the kernel patches.)

I realise that this discussion has moved on considerably since the
original posting, but I just wanted to revive the idea of enabling
support for custom patches for uClibc. I sent a patch a few weeks ago:

  http://patchwork.ozlabs.org/patch/222262/

but so far this has not received any feedback. For my workflow, using
the internal Buildroot toolchain for avr32, this would be an extremely
useful feature. Also, I feel that the patch is fairly innocuous. I'd
appreciate any comments that people might have.

Simon.
