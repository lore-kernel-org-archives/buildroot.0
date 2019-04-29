From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Apr 2019 22:25:52 +0200
Subject: [Buildroot] New lightweight Letsencrypt client with minimal
 dependecies
In-Reply-To: <20190428161130.GA11274@einstein.dilieto.eu>
References: <20190428161130.GA11274@einstein.dilieto.eu>
Message-ID: <ed5cefc4-8905-5e62-99fd-64e89bfe721a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/04/2019 18:11, Nicola Di Lieto wrote:
> Hello all
> 
> I have written and recently released uacme, an open source, lightweight ACME
> client written in C with minimal dependencies.? ACME is the protocol used by
> https://letsencrypt.org to issue free SSL certificates.? Version 2 of the
> protocol was standardized as RFC8555 in March 2019
> (https://tools.ietf.org/html/rfc8555 ).
> 
> I believe uacme is currently the only ACMEv2 compatible client written in C.?
> Other than libc, it depends only on libcurl and either GnuTLS or mbedTLS.?
> Particularly when built against mbedTLS, it is small enough that it can even run
> on embedded systems with limited memory.
> The software is at:
> 
> https://github.com/ndilieto/uacme
> 
> and the manual at https://ndilieto.github.io/uacme
> 
> If there is any interest, I can make patches to include it in buildroot.

 Adding it to Buildroot is not a bad way of advertising the project :-) Patches
are definitely welcome.

 Regards,
 Arnout
