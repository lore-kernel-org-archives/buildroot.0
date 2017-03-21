From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 21 Mar 2017 08:37:08 +0100
Subject: [Buildroot] [PATCH v2 1/2] leptonica: new package
In-Reply-To: <87k27km1jl.fsf@dell.be.48ers.dk>
References: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
 <1489910873-8450-2-git-send-email-gilles.talis@gmail.com>
 <87k27km1jl.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2xMt-Ab0wWX5PqP3JJJJKA3JaS5ROR+ObpLvyhKrJaqOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2017-03-20 16:05 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:
>
>  > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
>
>  > +config BR2_PACKAGE_LEPTONICA
>  > +    bool "leptonica"
>  > +    help
>  > +      Leptonica is a pedagogically-oriented open source site containing
>  > +      software that is broadly useful for image processing and image
>  > +      analysis applications.
>
> I know this description is taken verbatim from the upstream site, but it
> imho isn't very helpful. This is not a (web)site. What is is really? A
> image processing library ans some applications?
Yes, leptonica is essentially an image processing library. Do you want
me to update the description?

Thanks
Gilles
