From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 15 Nov 2013 13:38:23 +0100
Subject: [Buildroot] skeleton   hosts file content for ipv6 ?
In-Reply-To: <52860529.6060207@zacarias.com.ar>
References: <79606BB255D84F1DA71D659AD8F8AE6A@JohanW7>
 <52860529.6060207@zacarias.com.ar>
Message-ID: <F7A50608C6F94A908AA45301657E62DE@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo ;

Thanks ,for the info, maybe this line should be appended to the hosts file by buildroot when ipv6 is enabled in the configuration. 

Regards ,Johan


-----Oorspronkelijk bericht-----
Van: Gustavo Zacarias [mailto:gustavo at zacarias.com.ar] 
Verzonden: vrijdag 15 november 2013 12:28
Aan: Sagaert Johan; buildroot at busybox.net
Onderwerp: Re: [Buildroot] skeleton hosts file content for ipv6 ?

On 11/15/2013 08:16 AM, Sagaert Johan wrote:

> Hi All;
>  
> When enabling ipv6 , what should be in the /etc/hosts file ?
>  
> For ipv4 it is mostly just 127.0.0.1 localhost What should be added 
> when ipv6 has been enabled ?

For the basic barebones the same counterpart
::1 localhost

Regards.
