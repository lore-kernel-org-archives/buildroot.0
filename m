From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Jun 2014 19:32:37 -0300
Subject: [Buildroot] [PATCH] openntpd: add SysV initscript and user
In-Reply-To: <20140622172319.GA21768@free.fr>
References: <1402486395-15125-1-git-send-email-gustavo@zacarias.com.ar>
 <20140622172319.GA21768@free.fr>
Message-ID: <53A75985.4040604@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/2014 02:23 PM, Yann E. MORIN wrote:

> Any reason why you name the user and group with a leading '_' ?

Because the code says so, and it's not configurable.
The group just to keep consistency.
Regards.
