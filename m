From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 02 Dec 2014 14:40:31 +0100
Subject: [Buildroot] [PATCHv2 2/4] pkg-generic: add step_pkg_size global
	instrumentation hook
In-Reply-To: <1584811.M4fI97sQSe@aquila>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141202132349.5a02a3a4@free-electrons.com> <1584811.M4fI97sQSe@aquila>
Message-ID: <2051768.FyKtzhdtK4@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 02 December 2014 14:22:11 J?r?me Pouiller wrote:
> On Tuesday 02 December 2014 13:23:49 Thomas Petazzoni wrote:
[...]
> I just noticed another thing. To make this feature compatible to 
> BR2_JLEVEL, we just need to manage a mutex in step_pkg_size hook. Do 
  ^^^^^^^^^^
Sure, I meant "top-level parallel make".

> you planned to add one?

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
