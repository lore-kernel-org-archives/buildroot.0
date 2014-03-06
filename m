From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 23:30:51 +0100
Subject: [Buildroot] [PATCH 6/6] toolchain-external: add Linaro ARM big
 endian toolchain
In-Reply-To: <877g87t18s.fsf@dell.be.48ers.dk>
References: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1394058220-5863-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <877g87t18s.fsf@dell.be.48ers.dk>
Message-ID: <20140306233051.7f4add0c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 06 Mar 2014 23:23:47 +0100, Peter Korsgaard wrote:

>  > Linaro has started to release ARM big endian toolchains, so we
>  > integrate this toolchain in the external toolchain logic of
>  > Buildroot. Since ARM big endian is probably going to be a lot more
>  > confidential than ARM little endian, we will only support one version
> 
> confidential? Do you mean 'specialized' or 'uncommon'?

Yes. In French "confidentiel" has two different meanings: it might mean
"secret", or when talking about the usage, it can mean "rarely". I'll
change to "uncommon", which is certainly better.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
