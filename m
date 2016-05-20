From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 20 May 2016 09:31:51 +0100
Subject: [Buildroot] [PATCH v3 next] openblas: new package
In-Reply-To: <20160519160040.1eee27e6@free-electrons.com>
References: <1463652602-3276-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160519142103.507c1395@free-electrons.com> <573DC2D6.5090003@imgtec.com>
 <20160519160040.1eee27e6@free-electrons.com>
Message-ID: <573ECB77.9080100@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Samuel,

On 19/05/16 15:00, Thomas Petazzoni wrote:
>>>> > >> +# Disable fortran if the fortran compiler doesn't actually exist.
>>>> > >> +ifeq ($(wildcard $(TARGET_FC)),)  
>>> > > 
>>> > > I don't really like this way of testing if we have Fortran support. We
>>> > > probably want some kind of BR2_TOOLCHAIN_HAS_FORTRAN hidden config
>>> > > option. Talk with Samuel, I think he had some patches that were adding
>>> > > this kind of stuff for the external toolchains.  

do you have those patches Thomas is talking about? If so, do you plan to
send them to the ML?

Regards,

Vincent.
