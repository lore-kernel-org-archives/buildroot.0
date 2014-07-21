From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jul 2014 13:30:03 -0300
Subject: [Buildroot] [RFC 1/3] Rename package mpc to libmpc
In-Reply-To: <20140721162558.749a1393@free-electrons.com>
References: <1405951937-21226-1-git-send-email-jkrause@posteo.de>
 <1405951937-21226-2-git-send-email-jkrause@posteo.de>
 <20140721162558.749a1393@free-electrons.com>
Message-ID: <53CD400B.1070106@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/21/2014 11:25 AM, Thomas Petazzoni wrote:

> That being said, I would prefer to find a different name for the mpc
> package (mpd client) rather than renaming existing packages.

+1
Renaming it is potentially very problematic for people that use mpc
(multiprecision library) for their own projects, mpc would be a
completely different thing now and we can't make it legacy either since
there would be a new mpc.
Just call it mpclient and use a different bool IMHO.
Regards.
