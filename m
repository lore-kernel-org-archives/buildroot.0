From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 22:25:31 +0200
Subject: [Buildroot] [PATCH v2] libmbim: fix build with musl libc
In-Reply-To: <20170911085533.4340-1-aleksander@aleksander.es>
References: <20170911075426.514-1-aleksander@aleksander.es>
 <20170911085533.4340-1-aleksander@aleksander.es>
Message-ID: <46dc9b65-d73c-383e-1bb5-b118d12c1020@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-09-17 10:55, Aleksander Morgado wrote:
> This is now failing because the libgudev dependency is optional and
> the build will only use if it's found during the configure checks.
> 
> Imported the same patch that has been applied in the upstream libmbim
> git repository:
>   https://cgit.freedesktop.org/libmbim/libmbim/commit/?id=417b0b80023dc30d61c111ec0a54da2884d3a541
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>

 Applied to master, thanks.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
