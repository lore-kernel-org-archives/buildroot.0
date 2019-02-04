From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 4 Feb 2019 19:20:07 +0100
Subject: [Buildroot] [PATCH v2] docs/website: consolidate CDN's and
 enable SRI
In-Reply-To: <878syvtoa5.fsf@dell.be.48ers.dk>
References: <1549275445-11857-1-git-send-email-angelo@amarulasolutions.com>
 <87y36vvij1.fsf@dell.be.48ers.dk>
 <CA+_SqVbAV37MoGC64N3ai--f0Wv3-nXZ2vOqwvVW0EVLC6Ysqg@mail.gmail.com>
 <87lg2vvepy.fsf@dell.be.48ers.dk>
 <CA+_SqVZjokW23jK4j1aKqUtHFCbRAn2s8zXWvZ-2mFN3AoNTwQ@mail.gmail.com>
 <878syvtoa5.fsf@dell.be.48ers.dk>
Message-ID: <CA+_SqVZ2gKXF+RihYP0tQOh5hx8CicXz6o2V4K7WmFoK88w8+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2019 at 7:13 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>
> Hi,
>
>  >> Yes, but given their small size, this is probably not a huge concern?
>  >> E.G. news.html is ~200KB.
>
>  > Yes, I know, in an optimistic world we could have that page sliced on
>  > smaller chunks and retrieved one chunk at a time.
>  > It could be done, but I don't know how much that page is visited.
>  > I don't know if we have a proper network load statistics to understand
>  > if this could be a valuable work to do.
>
> We afaik don't really have any data. We used to have Google analytics on
> the website, but it seems to be broken.
>
>
>  >> > Moreover, saving a compressed javascript in git it's not recommended
>  >> > because their somewhat like binary files.
>  >>
>  >> Correct, but we already have the website images in it as well. Given
>  >> that these things only rarely change, I don't think that is a big
>  >> concern.
>
>  > Yes I know, but unless we pay to host on a CDN ourselves, we can't do
>  > otherwise.  I think that something could be optimized from a size
>  > point of view.
>
>  > I think if we can save some some bandwidth, we should go that route,
>  > but if costs are not a main concern, we can opt to have everything on
>  > local server.
>
> We don't directly pay for bandwidth (osuosl.org does), and I seriously
> doubt it is significant compared to sources.buildroot.org (~1.5TB/month).

So no problem!

I'll have a look at why google analytics doesn't work anymore.

>
> --
> Bye, Peter Korsgaard
