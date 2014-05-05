From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 5 May 2014 11:30:06 +0200
Subject: [Buildroot] Two stages compilation
In-Reply-To: <263e47a3-2d39-4a33-a352-0e225ac04a3b@email.android.com>
References: <CA+TH9Vns0mvj6X2UiP_Biu1bnG4Adwg+UFhfnN9Dm4W9AGLx1A@mail.gmail.com>
 <535F8499.8070406@gmail.com>
 <CA+TH9VmbVayiELjF9FaMDBBE9tJvgBy8b2CUovg74b4qh4nBNA@mail.gmail.com>
 <CAAXf6LVtAuS4DHWH9B-HtMcL-H6JszDsA2853c6FpM2Pu50WbA@mail.gmail.com>
 <20140430210324.31be1446@skate>
 <CA+TH9V=W5gr5r_TuFXxVyN4gJp7f9pS7MQrG45G7KAq5jKLf6g@mail.gmail.com>
 <263e47a3-2d39-4a33-a352-0e225ac04a3b@email.android.com>
Message-ID: <CA+TH9VnAcApreQV-K2pVY7ZAOTpcZrW+R4jyoowFQPydukKUgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Since host packages are normally not user selectable, you need to add a dependency to it from another package. For example using:
>
> MONO_NATIVE_DEPENDENCIES += host-mono-managed
>
> Another approach is where the use can choose whether he wants the host part too. This is only good if course if it is not strictly required. In this case you would add it in a Config.in.host file which would be included from the host utilities menu.

I Thomas, after your advice, everything started working!!! Right now
I'm making some more tests, but the packages compiles correctly. When
finished, I'll make a patch and publish it on the mailing list.

Probably I have to reread the documentation because I missed this part
about host compiling and dependencies.

Thank you again for your support!


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
