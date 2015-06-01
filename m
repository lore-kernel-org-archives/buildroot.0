From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 01 Jun 2015 21:08:03 +0200
Subject: [Buildroot] Buildroot 2015.05 released
In-Reply-To: <87mw0kv3fx.fsf@dell.be.48ers.dk>
References: <87mw0kv3fx.fsf@dell.be.48ers.dk>
Message-ID: <556CAD93.8090906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/31/15 23:32, Peter Korsgaard wrote:
[snip]
> And a special thanks to our patch reviewers:
> 
> git log 2015.02.. | grep -Ei '(reviewed|acked)-by:' | \
>     sed 's/.*by: //' | sort | uniq -c | sort -n -r

 For the future, perhaps also include the testers:

git log 2015.02..2015.05 | grep -i 'tested-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     19 Yann E. MORIN
     15 Arnout Vandecappelle (Essensium/Mind)
     12 Gary Bisson
      7 Gustavo Zacarias
      6 Romain Naour
      5 Vicente Olivert Riera
      4 Gwenhael Goavec-Merou
      4 Gergely Imreh
      2 Waldemar Brodkorb
      2 Thomas Petazzoni
      2 Samuel Martin
      2 Luca Ceresoli
      2 J?rg Krause
      2 Fabio Porcedda
      1 Thomas De Schampheleire
      1 Steven Noonan
      1 Ryan Barnett
      1 Ryan Barnett
      1 Rostislav Lisovy
      1 Jaap Crezee
      1 Baruch Siach
      1 Angelo Compagnucci
      1 Andr? Hentschel
      1 Maxime Hadjinlian



 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
