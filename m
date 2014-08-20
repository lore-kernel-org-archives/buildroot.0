From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Aug 2014 10:49:14 -0300
Subject: [Buildroot] [PATCHv2] package/gcc: cleanup arch/cpu combinations
In-Reply-To: <20140820154213.00c239a8@free-electrons.com>
References: <1408482998-24200-1-git-send-email-gustavo@zacarias.com.ar>	<20140820142417.31c93ef2@free-electrons.com>	<53F49408.3050701@zacarias.com.ar>
 <20140820154213.00c239a8@free-electrons.com>
Message-ID: <53F4A75A.1030505@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/20/2014 10:42 AM, Thomas Petazzoni wrote:

> Right, but I believe it's two different (but related) matters:
> 
>  * On one hand, Mischa's approach is good to specify starting from
>    which gcc version this or that architecture or architecture variant
>    was supported. It allows to encode the "theory".
> 
>  * On the other hand, additional 'depends on' can be added
>    exceptionally to prevent certain gcc versions from being selected,
>    when they are supposed to work in theory, but in practice do not
>    work due to bugs (that are likely to be fixed in the next point
>    release).

True.
My basic aim here was to make things more legible when i was putting a
limit on power8 since it was too cluttered already with a single depends
being 300 characters wide - hardly legible and very prone to
mistakes/redundancy.
I think we can commit this and "upgrade it" so to speak when Mischa's
patchset is in to clean it up more.
Regards.
