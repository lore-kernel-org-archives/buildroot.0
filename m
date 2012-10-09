From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 9 Oct 2012 22:29:51 +0200
Subject: [Buildroot] Freeing init memory
In-Reply-To: <1349813900.99916.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1349813900.99916.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <CAAfyv36drcryDpXbCYVA2X0R_0upU1c3txTLUY4XghRO2y3Kxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 9, 2012 at 10:18 PM, Zoran Djordjevic <djdjdjole@yahoo.com> wrote:
> When my ARM board with Buildroot built linux starts booting
> at some point of time (after mounting root (jffs2 file system) I get console
> message: "Freeing init memory". This part of booting process takes 10
> seconds,
> so I am interested what system do at that time and particularly if that time
> could be reduced ?
Freeing init memory meas it free memory which was used during init. IMO jffs2
mounting take such long time. Can you paste boot log snippet?
>
> Regards
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
