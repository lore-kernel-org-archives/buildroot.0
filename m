From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Dec 2013 07:23:53 -0300
Subject: [Buildroot] [PATCH 4/5] zsh: alpha sort menu option
In-Reply-To: <20131203095020.2a02cf8f@skate>
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>	<1385981368-2235-4-git-send-email-gustavo@zacarias.com.ar>	<87iov6pd8f.fsf@dell.be.48ers.dk>
 <20131203095020.2a02cf8f@skate>
Message-ID: <529DB139.1080309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/03/2013 05:50 AM, Thomas Petazzoni wrote:

> Ideas:
> 
>  * Instead of "Shell and utilities", have two menus: "Shell" and
>    "Utilities".
> 
>  * In the "Shell and utilities" menu, create two sub-sections,
>    separated by comments:
> 
> comment "Shells"
> ... some packages ...
> 
> comment "Utilities"
> ... some packages ...

Yes why not?
There aren't enough options to justify sub menus.
While we are on this topic the situation for Graphic libraries and
applications has gone out of control, we really need to split it up a
bit because comments for sections are getting mixed up with comments for
dependencies - it _REALLY_ looks ugly.
Any takers?
Regards.
