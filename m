From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Jun 2014 19:43:47 -0300
Subject: [Buildroot] [PATCH] openntpd: add SysV initscript and user
In-Reply-To: <20140622223724.GE21768@free.fr>
References: <1402486395-15125-1-git-send-email-gustavo@zacarias.com.ar>
 <20140622172319.GA21768@free.fr> <53A75985.4040604@zacarias.com.ar>
 <20140622223724.GE21768@free.fr>
Message-ID: <53A75C23.1090603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/2014 07:37 PM, Yann E. MORIN wrote:

>>> Any reason why you name the user and group with a leading '_' ?
>>
>> Because the code says so, and it's not configurable.
>> The group just to keep consistency.
> 
> Ok, that should be noted as a comment above the user definition, I
> guess.

Why?
We don't document these details for systemd or other packages, why
should we here?
I think the _USERS variable is explicit enough as documentation.
Regards.
