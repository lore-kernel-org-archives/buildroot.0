From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Jul 2015 11:31:18 -0300
Subject: [Buildroot] [PATCH] gcc: add gcc 5.2.0
In-Reply-To: <20150716233017.383ce16b@free-electrons.com>
References: <1437079928-9591-1-git-send-email-gustavo@zacarias.com.ar>
 <20150716225639.14772165@free-electrons.com>
 <55A81B35.2040200@zacarias.com.ar>
 <20150716231024.656693cb@free-electrons.com>
 <55A81E9E.8000103@zacarias.com.ar>
 <20150716233017.383ce16b@free-electrons.com>
Message-ID: <55A911B6.3000502@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/07/15 18:30, Thomas Petazzoni wrote:

> Yes, I think skipping 5.2.0 for the time is the best option. As I said,
> it anyway doesn't make much sense to have a compiler that doesn't even
> build a kernel properly for a major architecture like ARM.

Hi.
I've retested and found that i've got a busted versatile launcher script 
(used for webkit testing), after reverting some changes it works just fine.
So 5.2.0 it is, replacing 5.1.0.
Regards.
