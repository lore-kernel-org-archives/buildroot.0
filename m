From: Martin Bark <martin@barkynet.com>
Date: Sun, 12 Jan 2014 20:39:04 +0000
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <87y52l2c99.fsf@dell.be.48ers.dk>
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <87y52l2c99.fsf@dell.be.48ers.dk>
Message-ID: <52D2FD68.3050401@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Woo hoo, my first contribution to buildroot.

Thanks Peter.  I was just about to send a v4 patch so you saved me a job :)


On 12/01/14 20:09, Peter Korsgaard wrote:
>>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
>
>   > CA certificates used for SSL based applications.  The package installs CA
>   > certificates to /usr/share/ca-certificates and creates symbolic links under
>   > /etc/ssl/certs.  For example, the existing libcurl package will use these
>   > certificates for https urls.  Based on the debian ca-certifcates package.
>
>   > Signed-off-by: Martin Bark <martin@barkynet.com>
>
> Committed with Yann's comment taken into account, thanks.
>
