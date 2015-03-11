From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 20:02:36 -0300
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <5500BBE3.2030709@mind.be>
References: <550069E9.5060403@zacarias.com.ar> <5500BBE3.2030709@mind.be>
Message-ID: <5500C98C.7070302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/2015 07:04 PM, Arnout Vandecappelle wrote:

>  Could you calculate this with STATIC and thumb and also report the baseline?
> IIRC a minimal statically linked busybox was only about 200K so the 20K
> largefile is borderline significant...

Default busybox config arm926 thumb1 static (no threads):
LFS = 576212 bytes
non-LFS = 571156 bytes
Delta = 5056 bytes.

Regards.
