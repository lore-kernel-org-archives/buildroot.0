From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:34:21 +0200
Subject: [Buildroot] [PATCH] modem-manager: remove -Werror from CFLAGS
In-Reply-To: <1339574338.1832283.1526937237840.JavaMail.zimbra@datacom.com.br>
 (Carlos Santos's message of "Mon, 21 May 2018 18:13:57 -0300 (BRT)")
References: <CAGm1_kuEqW+Mito5P8rMxdM+zrCFAxpu2TzsZa=mvDAK8d1e1w@mail.gmail.com>
 <20180521114529.3513-1-casantos@datacom.ind.br>
 <87603hj97d.fsf@dell.be.48ers.dk>
 <1339574338.1832283.1526937237840.JavaMail.zimbra@datacom.com.br>
Message-ID: <87o9h8itgi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

>> Wouldn't passing --disable-more-warnings work instead of hacking up
 >> configure?

 > Yes, if you don't forget the trailing "s" in --disable-more-warnings,
 > like I did in my first attempt. :-P

heh ;)

 > I will send an updated patch.

Notice that I already sent such a patch with you in CC:

https://patchwork.ozlabs.org/patch/917852/

-- 
Bye, Peter Korsgaard
