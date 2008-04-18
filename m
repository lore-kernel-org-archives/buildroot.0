From: Sean Perry <shaleh@speakeasy.net>
Date: Thu, 17 Apr 2008 22:40:27 -0700
Subject: [Buildroot] Anyone know how I can make my Buildroot filesystem
 R/W?
In-Reply-To: <326f33790804171739s79ba1be1s929513770702d548@mail.gmail.com>
References: <326f33790804171739s79ba1be1s929513770702d548@mail.gmail.com>
Message-ID: <4808344B.5050201@speakeasy.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arun Reddy wrote:
> I am so happy that I have my new bootable filesystem created by 
> buildroot! But I noticed when I boot it up I can't write or change 
> anything. Does anyone know how I can make my new system R/W instead of 
> just R?
> 

you need something more than 'mount -o remount,rw /'?
