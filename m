From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 12 May 2014 20:56:20 +0200
Subject: [Buildroot] make appends -undefined
In-Reply-To: <OF38D6EC3D.BF0675A0-ON85257CD6.00678BFE-85257CD6.0067B043@LocalDomain>
References: <OF38D6EC3D.BF0675A0-ON85257CD6.00678BFE-85257CD6.0067B043@LocalDomain>
Message-ID: <4298b83f-4e2d-4013-9bfe-24d4d1625ce9@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Naitik Amin <Naitik.Amin@ametek.com> schreef:
>Hi,
>
>I have bunch of libs and apps, everytime I do make, my folders in the 
>output/build/ look like myapp-undefined, whereas my folder name under 
>package is myapp.
>
>Can someone help me, how can I avoid seeing "-undefined"

This is because you did not specify MYAPP_VERSION.
Have a look at the Buildroot manual for more information about which variables can/should be used.
http://buildroot.org/downloads/manual/manual.html#adding-packages

Best regards, 
Thomas
