From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 05 Dec 2013 10:08:19 -0300
Subject: [Buildroot] [PATCHv2] pkg-config: remove deprecated
In-Reply-To: <CAAXf6LWCbDGc9Wo6QTMpjHAbgSNTYRxxLT+d1w1Bb4ku-HJ2ew@mail.gmail.com>
References: <1386247960-10328-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LWCbDGc9Wo6QTMpjHAbgSNTYRxxLT+d1w1Bb4ku-HJ2ew@mail.gmail.com>
Message-ID: <52A07AC3.8080401@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/2013 10:06 AM, Thomas De Schampheleire wrote:
> Sorry that I didn't notice this the first time, but Makefile.legacy
> also still has a reference to host-pkg-config that needs to be
> removed.

That i'd leave for a little longer since people patching some
custom/random packages when upgrading their BR might get hit.
Regards.
