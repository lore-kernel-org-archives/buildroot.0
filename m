From: Pedro Sanchez <psanchez@fosstel.com>
Date: Thu, 11 Aug 2011 16:54:11 -0400
Subject: [Buildroot] Python standard library problems
In-Reply-To: <4E441E25.4010600@fosstel.com>
References: <4E42D99C.7080806@fosstel.com>
 <4E42FCAB.2070609@in-2-technology.co.uk> <4E43D5B4.2090106@fosstel.com>
 <4E43F72C.4060005@in-2-technology.co.uk> <4E441E25.4010600@fosstel.com>
Message-ID: <4E444173.3090509@fosstel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I built BR with crosstool-ng and with the native toolchain (uClibc) and 
I get the same results. I cloned the git repo three times to start from 
scratch each time, just changing the toolchain selection.

In my view building Python in current's BR is broken  :-(

-- 
Pedro


On 08/11/2011 02:23 PM, Pedro Sanchez wrote:
> Well, I'm not trying to build specific Python modules. I'm just
> selecting the Python interpreter from BR's config menu, that's all. I
> was expecting to get a full interpreter with support for the Python
> standard library.
>
> I'm trying to build BR now using the crosstool-ng toolchain ... If I run
> into similar problems then I'll see how to hook up into setup.py's
> output to see what's going on.
>
