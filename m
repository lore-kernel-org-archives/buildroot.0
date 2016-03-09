From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 9 Mar 2016 10:51:52 -0300
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <87egbj228a.fsf@dell.be.48ers.dk>
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk>
Message-ID: <56E02A78.1050701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/16 10:46, Peter Korsgaard wrote:

>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>   > Use shell ${STAGING_DIR} to expand at run time instead of build time
>   > hence avoiding hardcoding the staging directory in it and making it
>   > relocatable.
>
>   > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> Ehh, doesn't this break using pkg-config outside buildroot?

Hi.
Indeed it does, but you can't have the cake and eat it at once can you?
Arnout in the famous vala-wrapper thread pointed that we shouldn't 
hardcode the staging directory in it and i've adjusted accordingly, so 
which way is it? (same logic would apply to both cases). Re:
http://lists.busybox.net/pipermail/buildroot/2016-February/153671.html
Regards.
