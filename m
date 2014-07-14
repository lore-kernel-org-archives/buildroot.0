From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 13:01:04 +0200
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
 <1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140714130104.480ab4cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 12 Jul 2014 14:27:03 -0300, Gustavo Zacarias wrote:

> It adds some extra build time when doing autoreconf passes but the alternative
> would require a new GETTEXTIZE option and package audit which could take some
> time to get resolved.

I believe I would actually prefer a separate GETTEXTIZE option, I'm a
little bit worried about the extra build time. What do others think?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
