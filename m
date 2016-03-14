From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 08:49:27 +0100
Subject: [Buildroot] [PATCH v2] slang: make install-static do
	install-pkgconfig
In-Reply-To: <1457930833-17879-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Mon, 14 Mar 2016 07:47:13 +0300")
References: <1457930833-17879-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87pouxeby0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > mc's configure can't find S-Lang because static S-Lang build doesn't
 > install pkgconfig file into staging. Adding install-pkgconfig to
 > install-static dependencies fixes that.

 > Fixes:
 >   http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/

 > Upstream status: patch submitted.

Thanks!

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 > ---
 > Changes v1->v2:
 > - make it a separate patch, send upstream

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
