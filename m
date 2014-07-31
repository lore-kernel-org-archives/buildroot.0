From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Jul 2014 08:21:28 -0300
Subject: [Buildroot] [PATCH] packages: autoreconf non-vanilla libtool
 packages
In-Reply-To: <20140731082720.116b7b46@free-electrons.com>
References: <1406775740-20477-1-git-send-email-gustavo@zacarias.com.ar>
 <20140731082720.116b7b46@free-electrons.com>
Message-ID: <53DA26B8.3030203@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/31/2014 03:27 AM, Thomas Petazzoni wrote:

> Ok. Even though I'm not entirely happy about this solution, it seems to
> be the easiest one, and since we need to move forward, I've applied it
> for now.

Hi.
I agree, there's a couple of options to get it nicer, add a LIBTOOLIZE
option (not really a fan of that) or try to detect the subtly different
libtool 1.5 variant and use a different patch for that one.
I'll look into the second option.
Regards.
