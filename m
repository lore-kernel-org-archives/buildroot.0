From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 21:12:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/glmark2: fix wayland build
In-Reply-To: <20201108230932.465941-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 9 Nov 2020 00:09:32 +0100")
References: <20201108230932.465941-1-fontaine.fabrice@gmail.com>
Message-ID: <875z6es30q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > wayland-protocols is needed since
 > https://github.com/glmark2/glmark2/commit/58763e2c13db39ad7c1a994c261146154e4f0afa

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6106f07602c014897331daac3de01ac4a74e2016
 >  - http://autobuild.buildroot.org/results/b8d43fad291022cbc6e43988fe6bec14f594591a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
