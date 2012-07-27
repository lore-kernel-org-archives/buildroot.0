From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jul 2012 07:26:32 -0300
Subject: [Buildroot] [PATCH] less: build after busybox
In-Reply-To: <50124E38.6040504@mind.be>
References: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
 <CAHXCMM+ORAKWNqQJ34FEZ+AbQ5dfpVuZAF3Y85xz6Wf9pmccmg@mail.gmail.com>
 <50124E38.6040504@mind.be>
Message-ID: <50126CD8.7010201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 05:15, Arnout Vandecappelle wrote:

>  One alternative could be to automatically deselect less from busybox
> when the full-blown less is selected.  But also that is a bit complex
> I think.
> 
> 
>  Regards,
>  Arnout

I'm not a big fan of that either, it's not buildroot's resposability to
do effort deduplication.
With that reasoning should we disable busybox's httpd if
lighttpd/hiawatha/boa/some other web server is enabled?
It's a thin line to walk on, lighttpd > boa so boa should be disabled,
and things like that...
Regards.
