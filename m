From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 11:35:46 +0200
Subject: [Buildroot] Qt5 LTS handling [was: package/qt5: bump latest
 version to 5.12.4]
In-Reply-To: <51e24fc6-c609-b1b9-b2f3-5bf213b71436@mind.be> (Arnout
 Vandecappelle's message of "Sat, 13 Jul 2019 22:05:02 +0200")
References: <20190710173645.15459-1-ps.report@gmx.net>
 <20190710173645.15459-2-ps.report@gmx.net>
 <891f19e9-a64b-c025-b5cd-f7a0517fbc35@mind.be>
 <20190711210233.0b7eb0aa@gmx.net>
 <93af8798-0395-2c9f-dd0f-aad677dc0909@mind.be>
 <20190712211529.00fbf6e0@gmx.net>
 <8f646260-7e2b-8d47-82c0-2624e86cfb56@mind.be>
 <87k1cm9smt.fsf@dell.be.48ers.dk>
 <51e24fc6-c609-b1b9-b2f3-5bf213b71436@mind.be>
Message-ID: <87ftn99cwd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Just as a reminder: if we just have latest, we would end up with Qt 5.14 in
 > 2020.02, but that will stop receiving updates in June or so. So we will have
 > half a year without (security) updates to Qt.

 >  IMO, LTS is best effort so this is acceptable.

I guess so too. We so had very few qt updates in our LTS series anyway:

for i in 2017 2018 2019; do
 echo $i.02:; git shortlog -sn $i.02..$i.02.x -- package/qt5;
done

2017.02:
     5  Peter Seiderer
     3  Ga?l PORTAY
     2  Bartosz Golaszewski
     2  Yann E. MORIN
     1  Peter Korsgaard
     1  Vicente Olivert Riera
2018.02:
     6  Ga?l PORTAY
     3  S?bastien Szymanski
     2  Laurent Hartanerot
     2  Peter Korsgaard
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Giulio Benetti
     1  Joshua Henderson
     1  Manfred Schlaegl
     1  Peter Seiderer
     1  Romain Reignier
2019.02:
     2  Giulio Benetti
     1  Fabrice Fontaine
     1  Ga?l PORTAY

And none of them afaik were directly security fixes.

-- 
Bye, Peter Korsgaard
