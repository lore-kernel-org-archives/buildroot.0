From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Apr 2014 12:03:39 -0300
Subject: [Buildroot] [PATCH 4/6] disable eglibc, no time to test
In-Reply-To: <1397382423-4939-5-git-send-email-wbx@openadk.org>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
 <1397382423-4939-5-git-send-email-wbx@openadk.org>
Message-ID: <5355334B.8050309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/13/2014 06:47 AM, Waldemar Brodkorb wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

It actually fails like you say in
https://sourceware.org/ml/libc-help/2014-04/msg00020.html
So basically:

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Probably easy to port the patch to eglibc though.
Regards.
