From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Dec 2013 12:48:31 +0100
Subject: [Buildroot] OpenVPN doesn't start
In-Reply-To: <CALADVSN=r5a_LrowrHVnrGNYt6APYUidHm7GRwQc3upCVYhxKQ@mail.gmail.com>
References: <CALADVSN=r5a_LrowrHVnrGNYt6APYUidHm7GRwQc3upCVYhxKQ@mail.gmail.com>
Message-ID: <52A6FF8F.3060606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/13 19:53, Javier Alejandro Saenz Leguizamon wrote:
> Hi.
>
> I'm always getting this error when start my Open VPN client:
>
> /etc/init.d/S60openvpn  start
> Starting openvpn: FAILED-> server.
>
> I check the log (/var/log/openvpn.log) and it seems the problem is LZO
> compression.
>
> Thu Jan  1 00:41:12 1970 us=447937 OpenVPN 2.3.2
> armeb-buildroot-linux-gnueabi [SSL (OpenSSL)] [LZO] [EPOLL] [MH] [IPv6]
> built on Dec  4 2013
> Thu Jan  1 00:41:12 1970 us=449843 WARNING: No server certificate
> verification method has been enabled.  See
> http://openvpn.net/howto.html#mitm for more info.
> Thu Jan  1 00:41:12 1970 us=471562 Cannot initialize LZO compression library
> Thu Jan  1 00:41:12 1970 us=471968 Exiting due to fatal error
>
> so I check the menuconfig and is enabled,  and now I dont know what to
> do, can anyone help me pls.
>
> I'm using codesourcery 2013.05 toolchain and buildroot-2013.08.1, I'll
> attach my .config.

  You don't even seem to have OpenVPN enabled, so how can you even start it?

  Regards,
  Arnout

>
> thank you very much for your help
>
>
>
> Javier Alejandro S?enz Leguizam?n
> Ingeniero Electr?nico
> Universidad Nacional de Colombia
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
