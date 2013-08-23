From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 23 Aug 2013 14:06:15 +0100
Subject: [Buildroot] [PATCH] python-setuptools: Add missing
 $(TARGET_DIR) to PYTHONPATH.
In-Reply-To: <52175AA7.3030709@zacarias.com.ar>
References: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
 <20130823070113.122e718f@skate> <52175AA7.3030709@zacarias.com.ar>
Message-ID: <CAG2jQ8g2HdwVJC71_TpkoGAdy55AgG+F=F0zVxtvp8QfipOpFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On 23 August 2013 13:50, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> Looks good in principle.
> I'd like another thing fixed since for the target setuptools... purge
> the damn windows executables :)
> In the host that might not matter much, but for the target we're talking
> ~ 400 KiB extra nonsense (those cli*.exe and gui*.exe files that are
> shipped).
> The tests might be another candidate for removal at ~ 200 KiB.
> Regards.
>

In Gentoo we have the following patch:

http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-python/setuptools/files/setuptools-0.6.45-no-exes.patch?revision=1.2&view=markup

I will test it against buildroot and submit it as a new patch soon.

Thanks for the review.

-- 
Regards,
Markos Chandras
