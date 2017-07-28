From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Jul 2017 16:21:56 +0100
Subject: [Buildroot] Buildroot help
In-Reply-To: <AM5P189MB040249379DC7104931E73A52DABF0@AM5P189MB0402.EURP189.PROD.OUTLOOK.COM>
References: <AM5P189MB040249379DC7104931E73A52DABF0@AM5P189MB0402.EURP189.PROD.OUTLOOK.COM>
Message-ID: <87eae8e0-89c3-f297-2913-62d1f0d50475@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Davide,

On 28/07/17 15:26, Davide Piccardi wrote:
> Hello, I'm working with buildroot with a certain configuration (which
> works correctly). If I add the package "openssl" and I run again the
> building process (Make) , it does not generate the bzImage. Do you have
> any suggestion ?

Why should Buildroot recompile the kernel when you add a new target package?

Vincent

> 
> Best regards.
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
