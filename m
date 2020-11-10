From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 21:25:40 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/webkitgtk: add optional
 systemd dependency
In-Reply-To: <20201109231356.32230-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 10 Nov 2020 00:13:56 +0100")
References: <20201109231356.32230-1-ps.report@gmx.net>
 <20201109231356.32230-2-ps.report@gmx.net>
Message-ID: <87k0utnem3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - systemd support/USE_SYSTEMD option was added since 2.30.0,
 >   so add an optional dependency

 > Fixes:

 >   -- Could NOT find Systemd (missing: Systemd_LIBRARY Systemd_INCLUDE_DIR)
 >   CMake Error at Source/cmake/OptionsGTK.cmake:425 (message):
 >     libsystemd is needed for USE_SYSTEMD

 > Reported-by: C Larbi <pkl2000us@gmail.com>
 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
