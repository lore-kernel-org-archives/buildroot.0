From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Jul 2017 20:19:33 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: bump to version 2.16.5
In-Reply-To: <20170705200406.GB2822@momiji> (Adrian Perez de Castro's message
 of "Wed, 5 Jul 2017 20:04:06 +0300")
References: <20170705143303.26282-1-aperez@igalia.com>
 <87a84izzff.fsf@dell.be.48ers.dk> <20170705200406.GB2822@momiji>
Message-ID: <871spuzqyy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> Thanks! I've had bumping webkitgtk on my TODO for a while as there old
 >> version is affected by a number of CVEs.

 > You're welcome! I am a WebKit developer myself (mostly working on the GTK+
 > port), and we have been trying that distributions ship WebKitGTK+ updates
 > promptly. At work we use Buildroot now and then, and we were just wondering
 > why an old version was still in use ? so I just went ahead and sent the patch
 > to update, hoping that it would go through :-)

Great, thanks for doing that! Our webkitgtk package could definately use
some love!

 >> I take it that you actively use webkitgtk? I personally don't. Would you
 >> be interested getting added to DEVELOPERS and looking after the package?

 > Sure thing, I can send a patch to add myself. For testing builds I usually
 > target the Raspberry Pi 3, which is what I have around always for testing.
 > Is this enough for me to try builds when making patches, or would you
 > recommend having some other board for development? Everyday WebKit development
 > is done on x86_64, so that's a very well tested target, too.

I think testing on a rpi3 would be fine, thanks.

 > On a different note, I am also considering to submit packages in the following
 > days for the WPE WebKit port [1], which has a focus on embedded and has been
 > recently upstreamed. This will be more than a single patch because the port
 > has graphics back-ends selectable at runtime. Do you think it would be
 > difficult to get those landed?

Sounds great - I don't see any reason why we wouldn't take them,
especially if you would help maintain them.

 > (We have a few downstream forks of Buildroot with build recipes, but they need
 > cleaning up in order to follow the contribution guidelines, and it would be
 > nicer to rebase those on ?master? when/if it gets the WPE packages in :D)

Ok, great!

 > [1] One of my work mates wrote a blog post about it a while ago:
 >     http://blogs.igalia.com/magomez/2016/12/19/wpe-web-platform-for-embedded/

Yes, I saw the blog back then - Nice work!

-- 
Bye, Peter Korsgaard
