From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Apr 2014 12:02:40 -0300
Subject: [Buildroot] [PATCH 1/6] use default binutils for microblaze
In-Reply-To: <1397382423-4939-2-git-send-email-wbx@openadk.org>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
 <1397382423-4939-2-git-send-email-wbx@openadk.org>
Message-ID: <53553310.10709@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/13/2014 06:46 AM, Waldemar Brodkorb wrote:

> Upstream binutils 2.24 works fine for microblaze, no need for
> Xilinx Git.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

You could depend on !BR2_microblaze for older versions since they won't
work.
Otherwise:

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
(on Qemu)

Thanks.
