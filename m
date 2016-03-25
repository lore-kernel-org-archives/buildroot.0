From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 19:06:01 -0300
Subject: [Buildroot] [PATCH] busybox: security bump to version 1.24.2
In-Reply-To: <87r3eydxn7.fsf@dell.be.48ers.dk>
References: <1458942992-10172-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3eydxn7.fsf@dell.be.48ers.dk>
Message-ID: <56F5B649.6080704@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/03/16 19:02, Peter Korsgaard wrote:

>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>   > The version bump doesn't inherently fix the security issues, however the
>   > added CVE patches do, which fix:
>
>   > CVE-2016-2147 - out of bounds write (heap) due to integer underflow in
>   > udhcpc.
>   > CVE-2016-2148 - heap-based buffer overflow in OPTION_6RD parsing.
>
>   > Drop patches that are upstream as well.
>
>   > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> I also have problems applying this one:

Odd, it does apply if i download it from patchwork into a clean 
buildroot tree.
I do get the warnings, but the whitespace is inherent in the CVE patches.
Regards.
