From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Nov 2009 20:25:01 +0100
Subject: [Buildroot] [git commit master] Revert "gvfs: update to version
	1.4.0"
In-Reply-To: <1259090478.30370.35.camel@bender> (Sven Neumann's message of
	"Tue\, 24 Nov 2009 20\:21\:18 +0100")
References: <20091124190731.322B07625B@busybox.osuosl.org>
	<1259090478.30370.35.camel@bender>
Message-ID: <873a43d8tu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> The new gvfs version needs libglib2 >= 2.21.2, but newer libglib2
 >> versions need ipv6 support and possibly cause other problems, so
 >> simply revert the gvfs bump for now.

 Sven> We are using libglib2 2.22.2 without any problems for quite a while
 Sven> already. But you are right, it needs ipv6 support.

Yes, I'm not expecting any real problems with 2.22.2, but prefer to keep
things safe for the release.

Thanks for the heads up.

-- 
Bye, Peter Korsgaard
