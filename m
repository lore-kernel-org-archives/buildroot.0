From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 22:38:07 +0100
Subject: [Buildroot] [PATCH v3 1/1] libcpprestsdk: fix building as a
 static library
In-Reply-To: <873722o95b.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 15 Feb 2018 11:10:56 +0100")
References: <20180212172350.5697-1-aduskett@gmail.com>
 <20180213231451.41f46d44@windsurf.lan>
 <873722o95b.fsf@dell.be.48ers.dk>
Message-ID: <87zi4akk74.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> Your commit log was missing a reference to the autobuilder failure
 >> being fixed, so I've added one and applied to master.

 > As it now uses pkg-config, libcpprestsdk should add host-pkgconf to
 > _DEPENDENCIES.

 > Care to send a patch?

I've now fixed it in git.

-- 
Bye, Peter Korsgaard
