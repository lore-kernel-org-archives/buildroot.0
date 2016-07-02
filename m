From: Julien Floret <julien.floret@6wind.com>
Date: Sat, 2 Jul 2016 21:15:11 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <a950cc3d-5aef-1591-e014-b786a5eb6fa1@mind.be>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
 <77293ee3-6e4c-7342-214d-adffdde679f8@mind.be>
 <20160702123305.6bfbbc81@free-electrons.com> <87poqw8ege.fsf@dell.be.48ers.dk>
 <CAHfJR7heFn1QsWoVSJB4kostyz9QTHVCKRNhgeerDBEx4tjVwQ@mail.gmail.com>
 <a950cc3d-5aef-1591-e014-b786a5eb6fa1@mind.be>
Message-ID: <CAHfJR7iYv=A_riLyW67mJuJzK3hZS+rDyfDbQbVWudT-2inCPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  Since that will be 64 patches, it may be a good idea to already submit just a
> subset.

Ok, done. By the way, I only found 60 packages to modify actually
(4 target packages have a dependency on their host variant only).
