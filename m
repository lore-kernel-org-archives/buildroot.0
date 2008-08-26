From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 26 Aug 2008 06:49:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <1219758158.3307.64.camel@localhost.localdomain>
References: <20080826121930.77B8B3C79C@busybox.net>
	<1219758158.3307.64.camel@localhost.localdomain>
Message-ID: <19162440.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Ormund Williams wrote:
> 
> I also had to up the version to 2.12.11 to get a correct build.
> __
> Ormund
> 
The version bump was coming later.
I currently use 2.12.9 and it all works well with DirectFB.
The problem is I never run X so version bumping something as big as GTK is a
bit scary. (I Imagine lots of very cross buildroot users if I break it!)
So I opted for first getting GTK to appear as an option when DirectFB was
selected!

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-libgtk2-tp19160871p19162440.html
Sent from the BuildRoot mailing list archive at Nabble.com.
