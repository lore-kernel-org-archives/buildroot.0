From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Mar 2009 07:59:27 +0100
Subject: [Buildroot] socket(PF_FILE, SOCK_STREAM, 0) not implemented
In-Reply-To: <kga2o8.4opixu@webmail.variomedia.de> (Karl Krach's message of
	"Tue\, 10 Mar 2009 07\:43\:20 +0100")
References: <kga2o8.4opixu@webmail.variomedia.de>
Message-ID: <87y6vdamnk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Karl" == Karl Krach <mailinglists@blueSpirit.la> writes:

Hi,

 Karl> Yes, of course - you re right. I'm using the kernel headers which are
 Karl> downloaded and installed by buildroot (2.5.28.x). Provides the buildroot
 Karl> configuration a way to used custom kernel headers? What do you think, is there
 Karl> a chance to get it working with a 2.4 kernel?

I've recently removed 2.4.31 kernel headers, but you could try
checking out r25435, then you should be able to select it after you
enable build options->Show package that are deprecated.

-- 
Bye, Peter Korsgaard
