From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 08:28:25 +0200
Subject: [Buildroot] [2018.02.x 1/2] makedevs: allow leading whitespace
 for capabilities
In-Reply-To: <20180809234235.47a45e5f@windsurf> (Thomas Petazzoni's message of
 "Thu, 9 Aug 2018 23:42:35 +0200")
References: <20180806031715.7088-1-ricardo.martincoski@gmail.com>
 <20180809234235.47a45e5f@windsurf>
Message-ID: <874lg2g2gm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > It is not clear to me why you have the "2018.02.x" prefix in your patch
 > title. I would assume this patch is needed in master, not just in
 > 2018.02.x. We generally include 2018.02.x in the patch title when
 > the patch should only be applied to 2018.02.x. For patches going in
 > master, and needing a backport, we normally rely on Peter being smart
 > and realizing that the patch is a fix that makes sense for 2018.02.x.

 > Could you clarify what was your intention with this 2018.02.x prefix ?

 > Perhaps we need to have some tags ?

 > Backport-to: 2018.02.x

 > when the patch is for master, but needs to be backported. And perhaps:

 > Apply-to: 2018.02.x

 > when the patch is to be applied only on 2018.02.x.

 > Or simply rely on informal notes below the "---" sign ?

Just stating it below the --- sign is IMHO good enough, and in the worst
case send a mail if I miss something.

-- 
Bye, Peter Korsgaard
