From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 24 Mar 2013 16:35:28 -0300
Subject: [Buildroot] [PATCH 2/2] uboot: integrate mkenvimage.
In-Reply-To: <1356007638-18476-2-git-send-email-rebillout@syscom.ch>
References: <1356007638-18476-1-git-send-email-rebillout@syscom.ch>
 <1356007638-18476-2-git-send-email-rebillout@syscom.ch>
Message-ID: <514F5580.7030302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/20/2012 09:47 AM, Arnaud R?billout wrote:

> This commit provides configuration options to automatically generate a
> binary environment image for U-Boot.
> Two options are available (and mandatory):
>  * the location of a text file describing U-Boot environment.
>  * the size of the environment.
> 
> Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
