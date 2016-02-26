From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 01:16:28 +0100
Subject: [Buildroot] [PATCH 01/32] package/lz4: bump version to r131
In-Reply-To: <CAHsRNLjcfgLffWFHSJ7y0uVXnU2+JNfa+nvNTDU47Ndt2eUjTg@mail.gmail.com>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-2-git-send-email-gabe@hashrabbit.co>
 <56CF91EA.6040300@mind.be>
 <CAHsRNLjcfgLffWFHSJ7y0uVXnU2+JNfa+nvNTDU47Ndt2eUjTg@mail.gmail.com>
Message-ID: <56CF995C.7050108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/16 00:57, Gabe Evans wrote:
> Hi Arnout,
>
> On Thu, Feb 25, 2016 at 3:44 PM Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
>
>      Hi Gabe,
>
>      I'm not going to review all of the series yet, just a few of them. The
> patches
>     which are pretty independent (like this one) you can resend individually. Only
>     when you resend the later ones you need to send the entire series.
>
>
> Thanks for having a look. I wasn't sure what to do with this one since it's
> needed for patch #4 (add --enable/disable-lz4) to work.

 Right... And will it automatically disable lz4 if the version is too low? Well,
it does mean that patch 4 is not applicable to master after all...

 Regards,
 Arnout

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
