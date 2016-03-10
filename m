From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 22:01:20 +0100
Subject: [Buildroot] [PATCH 0/8] core: allow for custom, local help;
 rearrange package-specific help (branch yem/help)
In-Reply-To: <56E0B327.70807@mind.be>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <56E0B327.70807@mind.be>
Message-ID: <20160310220120.03655e61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2016 00:35:03 +0100, Arnout Vandecappelle wrote:

>   This is where I have a different opinion. I don't see a problem with "mixing" 
> (it's actually appending) with the normal buildroot help. For the user, it makes 
> no difference if it's internal or external. And all the additional documentation 
> and special handling is really not worth it for such a corner case, IMHO.

I do fully agree with you. We want the simplest possible solution here,
because we don't want:

 1/ to enforce too much things

 2/ to have to write tons of documentation in our manual to document
    such a silly / corner case aspect

Please, let's stop over-engineering things. Keep It Simple Stupid.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
