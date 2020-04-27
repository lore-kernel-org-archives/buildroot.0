From: Yann CARDAILLAC <yann.cardaillac@smile.fr>
Date: Mon, 27 Apr 2020 09:34:37 +0200
Subject: [Buildroot] Build qt5webengine or chromium faster
Message-ID: <CAA984JXXz=j_E3_EHLP5nR_hdm_-sMAWTvE3PdBjonf7rGMgXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I was wondering if there's any recommended way to build chromium (or
qtwebengine) faster? Up to know I wasn't using chromium on our project and
build time was around 40mn. That was very acceptable for our CI jobs and we
could afford to build the full defconfig every time we merge/push code.
Now with chromium on the defconfig, full build takes more than 3 hours...
So my question is simple, how in such a case do you recommend to work ? Is
there any way to use "pre built" packages in a not too dirty way ?
I know that this is not really the buildroot philosophy however I believe
some buildroot users might have needed the same build trick than I do.
I thought about hosting all the binaries that I have built and then writing
a simple package that will take all of them and install them on
staging/target. But that's probably not the best way.
Any advice would be appreciated at this point !

Best regards,

Yann Cardaillac

-- 
[image: SMILE] <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*Yann CARDAILLAC*
Ing?nieur Syst?mes Embarqu?s

[image: email] yann.cardaillac at smile.fr
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>


[image: eco] Pour la plan?te, n'imprimez ce mail que si c'est n?cessaire
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200427/fd1ac8b4/attachment.html>
