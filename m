From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 15 Apr 2012 10:49:57 -0300
Subject: [Buildroot] [PATCH 2/2] ushare: new package
In-Reply-To: <871unpazef.fsf@macbook.be.48ers.dk>
References: <1334154982-23530-1-git-send-email-gustavo@zacarias.com.ar>
 <1334154982-23530-2-git-send-email-gustavo@zacarias.com.ar>
 <871unpazef.fsf@macbook.be.48ers.dk>
Message-ID: <4a940ca18d3b4e271c744174720c7e3b@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-15 10:38, Peter Korsgaard wrote:

> --disable-debug should only be passed if BR2_ENABLE_DEBUG isn't 
> enabled.

Ok, let's kill it then.

> You don't provide an alternative init script. Could this one not be 
> used
> (renamed to SXXushare)?

The shipped script is pretty much LSB so it won't work for us.
Also ushare would share some directory (non-standard) with media files, 
which directory would you suggest for a default?
I don't think we have one in the skeleton for that purpose.
Regards.
