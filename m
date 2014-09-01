From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 01 Sep 2014 21:59:14 +0200
Subject: [Buildroot] Buildroot 2014.08 released
In-Reply-To: <87oauzlghz.fsf@dell.be.48ers.dk>
References: <87oauzlghz.fsf@dell.be.48ers.dk>
Message-ID: <f49fbf9d-a67c-4999-9a00-9910117dfbcd@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> schreef:
>Hi,
>
>Buildroot 2014.08 is released - Go download it at:
...
>
>And a special thanks to our patch reviewers:
>
>git log 2014.05.. | grep -Ei '(reviewed|acked)-by:' | \
>    sed 's/.*[bB]y: //' | sort | uniq -c | sort -n -r
>
>    137 "Yann E. MORIN" <yann.morin.1998@free.fr>

Impressive! Great to see such commitment!

>     24 Samuel Martin <s.martin49@gmail.com>
>     23 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>     22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>     12 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>     12 Gustavo Zacarias <gustavo@zacarias.com.ar>
>      6 Markos Chandras <Markos.Chandras@imgtec.com>
>      4 Luca Ceresoli <luca@lucaceresoli.net>
>      4 Bernd Kuhls <bernd.kuhls@t-online.de>
>      2 "Spenser Gilliland" <spenser@gillilanding.com>
>      2 Baruch Siach <baruch@tkos.co.il>
>      2 Thomas De Schampheleire < thomas.de.schampheleire@gmail.com>
>      1 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
>      1 Ryan Barnett <ryan.barnett@rockwellcollins.com>
>      1 Markos Chandras <markos.chandras@imgtec.com>
>      1 Eric Le Bihan <eric.le.bihan.dev@free.fr>
>      1 Danomi Manchego <danomimanchego123@gmail.com>
>
>Once again our autobuilders have helped us fix a huge amount of build
>issues. Thanks to all the people reviewing failures and fixing issues:
>
>for i in $(git log --format=%H 2014.05..); do \
>    git show --quiet $i | grep -q http://autobuild && \
>    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
>        sort -rn -k1
>
>     49 Gustavo Zacarias
>     42 Thomas Petazzoni
>     29 Bernd Kuhls
>     15 Yann E. MORIN
>     14 Peter Korsgaard
>     11 Baruch Siach
>      9 Romain Naour
>      7 Francois Perrad
>      7 Anton Kolesov
>      6 Samuel Martin
>      5 Yuvaraj Patil
>      4 Max Filippov
>      3 Vicente Olivert Riera
>      2 Fatih A??c?
>      2 Eric Le Bihan
>      2 Arnaud Aujon
>      2 Alexey Brodkin
>      1 Peter Seiderer
>      1 Maxime Hadjinlian
>      1 Marcelo Guti?rrez(UTN/FRH)
>      1 Luca Ceresoli
>      1 J?rg Krause
>      1 Alexandre Belloni

And a personal thanks from me to all these people, both reviewers as autobuild fixers, for their important contribution to Buildroot!

Best regards,
Thomas
