From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Sep 2016 12:11:12 +0200
Subject: [Buildroot] [PATCH] package/nginx-naxsi: add pcre dependency to
	.mk
In-Reply-To: <CAHXCMML5P6B3XJkwRz8bZx41SOubeZRAfAp1-SCk4pRjpmE7AA@mail.gmail.com>
 (Samuel Martin's message of "Tue, 13 Sep 2016 21:33:02 +0200")
References: <20160913180102.4825-1-s.martin49@gmail.com>
 <20160913212249.0e79d44f@free-electrons.com>
 <CAHXCMML5P6B3XJkwRz8bZx41SOubeZRAfAp1-SCk4pRjpmE7AA@mail.gmail.com>
Message-ID: <87lgyqala7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

Hi,

 >> Is this really necessary? nginx-naxsi is not a real package, it just
 >> allows to download the source code of nginx-naxsi before nginx gets
 >> built.
 >> 
 >> And nginx.mk already has pcre in NGINX_DEPENDENCIES when pcre is
 >> enabled, so I believe the select added in
 >> 218dfdd9038af882a02fe64f13a533c8ce75ddc1 is sufficient.

 > I agree, hence the first patch...

 >> 
 >> If not, could you explain why?

 > ... but Arnout does not seem to share this opinion [1].

 > So, I'm tempted to said "maintainer call" on this.

 > [1] http://lists.busybox.net/pipermail/buildroot/2016-September/172113.html

I instead added a comment above the select to clarify and marked this
patch as superseeded in patchwork.

-- 
Bye, Peter Korsgaard
