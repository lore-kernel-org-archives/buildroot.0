From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Aug 2013 10:08:59 -0300
Subject: [Buildroot] [PATCH] python-setuptools: Add missing
 $(TARGET_DIR) to PYTHONPATH.
In-Reply-To: <CAG2jQ8g2HdwVJC71_TpkoGAdy55AgG+F=F0zVxtvp8QfipOpFg@mail.gmail.com>
References: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
 <20130823070113.122e718f@skate> <52175AA7.3030709@zacarias.com.ar>
 <CAG2jQ8g2HdwVJC71_TpkoGAdy55AgG+F=F0zVxtvp8QfipOpFg@mail.gmail.com>
Message-ID: <52175EEB.2040302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/23/2013 10:06 AM, Markos Chandras wrote:
> In Gentoo we have the following patch:
> 
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-python/setuptools/files/setuptools-0.6.45-no-exes.patch?revision=1.2&view=markup
> 
> I will test it against buildroot and submit it as a new patch soon.
> 
> Thanks for the review.

That or just add a post install target hook to remove them.
We usually prefer the later since we're poor and few and prefer to avoid
patches that might not apply for version bumps ;)
Regards.
