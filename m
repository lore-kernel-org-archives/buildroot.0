From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 07 Oct 2014 09:46:42 -0300
Subject: [Buildroot] [PATCH] openssh: bump to version 6.7p1
In-Reply-To: <20141007123927.GD8276@tarshish>
References: <1412680305-28778-1-git-send-email-gustavo@zacarias.com.ar>
 <20141007123927.GD8276@tarshish>
Message-ID: <5433E0B2.1030901@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/2014 09:39 AM, Baruch Siach wrote:

> Why not use the (base64 encoded) hash values from 
> http://www.openssh.com/txt/release-6.7? The output of
> 
> 	echo svg5Tq6Fjau9732sELma7ADJVGJ1PoA0LlMLu29yVQc= |base64 -d |hd
> 
> matches your calculated SHA256 AFAICS.

Hi.
Because i've found out about the release from another source.
Both are equally good though.
Regards.
